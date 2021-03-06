class TeamsController < ApplicationController
  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.find_by_name(params[:team][:team_name])
    if @team.nil?
    @team = Team.new(captain_id: params[:team][:captain_id],
		     team_name: params[:team][:team_name])

    respond_to do |format|
      if @team.save
         format.json { render json: @team, status: :created, location: @team }
         if params[:players]
         	TeamPlayers.create(params[:players], team_name: @team.name)
         end
      else
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
   else 
     Team.update(params[:team])
   end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:team][:team_id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
        if params[:players]
            TeamPlayers.update(params[:players], team_name: @team.name)
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  def count_all_games
    @team = Team.find(params[:id])

    @count_games = @team.count_all_games

    respond_to do |format|
      format.json { render json: @count_games }
    end
  end

  def show_all_games
    @team = Team.find(params[:id])

    @all_games = @team.show_all_games

    respond_to do |format|
      format.json { render json: @all_games }
    end
end
 

 def count_team_score
     @team = Team.find(params["id"])
     @team_score = @team.count_team_score
   
    respond_to do |format|
      format.json { render json: @team_score }
    end
  end
 
  def team_rating
   @team = Team.find(params["id"])
   @team_rating = 0
   
   @team_game_no = @team.count_all_games
   @team_score   = @team.count_team_score

   @team_rating  = @team_game_no / @team_score
 
    respond_to do |format|
      format.json {render json: @team_rating}
    end
  end

  def team_members
    @team = Team.find(params["id"])
    @members = @team.get_team_members

    respond_to do |format|
      format.json {render json: @members}
    end
  end

end


