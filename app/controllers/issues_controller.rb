class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  $themes = ["Pull back to process.", "Bring it forward.", 
    "Start to get the ball rolling.", "Plant the seeds."];

  $signs = ["Sagittarius/Capricorn", "Capricorn", "Capricorn/Aquarius", "Aquarius", "Aquarius/Pisces", "Pisces", "Pisces/Aries", "Aries", "Aries/Taurus", "Taurus", "Taurus/Gemini", "Gemini", "Gemini/Cancer", 
    "Cancer", "Cancer/Leo", "Leo", "Leo/Virgo", "Virgo", "Virgo/Libra", "Libra", "Libra/Scorpio", "Scorpio", "Scorpio/Sagittarius", "Sagittarius"]

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.order("issue_number DESC")
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @issue = Issue.find_by_id(params[:id])
    @last = Issue.order("issue_number DESC").first
    @first = Issue.order("issue_number ASC").first
    @next = Issue.where('issue_number > ?', @issue.issue_number).order("issue_number ASC").first  
    @prev = Issue.where('issue_number < ?', @issue.issue_number).order("issue_number ASC").last

    @prev_issue = @prev.present? ? @prev : @last
    @next_issue = @next.present? ? @next : @first
  end

  # GET /issues/new
  def new
    @issue = Issue.new
    3.times { @issue.sidebars.build }
    build_form
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params[:id])
    open = 3 - @issue.sidebars.count
    open.times { @issue.sidebars.build }
    build_form
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to issues_path, notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
      else
        3.times { @issue.sidebars.build }
        build_form

        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    # params[:issue][:existing_sidebar_attributes] ||= {}
    # params[:issue][:existing_monday_attributes] ||= {}

    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to issues_path, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        open = 3 - @issue.sidebars.count
        open.times { @issue.sidebars.build }
        build_form
        
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:issue_number, :week, :moon_phase,
        sidebars_attributes: [:id, :title, :link, :podcast_link_id, :_destroy], 
        monday_attributes: [:id, :date, :entry, :mantra, :moon_sign, :theme, :number_1, :number_2, :number_3],
        tuesday_attributes: [:id, :date, :entry, :mantra, :moon_sign, :theme, :number_1, :number_2, :number_3],
        wednesday_attributes: [:id, :date, :entry, :mantra, :moon_sign, :theme, :number_1, :number_2, :number_3],
        thursday_attributes: [:id, :date, :entry, :mantra, :moon_sign, :theme, :number_1, :number_2, :number_3],
        friday_attributes: [:id, :date, :entry, :mantra, :moon_sign, :theme, :number_1, :number_2, :number_3],
        saturday_attributes: [:id, :date, :entry, :mantra, :moon_sign, :theme, :number_1, :number_2, :number_3],
        sunday_attributes: [:id, :date, :entry, :mantra, :moon_sign, :theme, :number_1, :number_2, :number_3]

        )
    end

    def build_form
      @monday = @issue.build_monday if @issue.monday.blank? 
      @tuesday = @issue.build_tuesday if @issue.tuesday.blank? 
      @wednesday = @issue.build_wednesday if @issue.wednesday.blank?
      @thursday = @issue.build_thursday if @issue.thursday.blank?
      @friday = @issue.build_friday if @issue.friday.blank? 
      @saturday = @issue.build_saturday if @issue.saturday.blank?
      @sunday = @issue.build_sunday if @issue.sunday.blank?
    end
end
