class VictimsController < ApplicationController
  # GET /victims
  # GET /victims.json
  def index
    @victims = Victim.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @victims }
    end
  end

  # GET /victims/1
  # GET /victims/1.json
  def show
    @victim = Victim.find(params[:id])
    @comment = @victim.comments.build
    @current_user = @comment.user_id
    @comments = Comment.all.reverse
    @profile_pic = @victim.find_profile_photo
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @victim }

    end
  end

  # GET /victims/new
  # GET /victims/new.json
  def new
    @victim = Victim.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @victim }
    end
  end

  # GET /victims/1/edit
  def edit
    @victim = Victim.find(params[:id])
  end

  # POST /victims
  # POST /victims.json
  def create
    @facebook_url = params[:victim][:facebook_url]
    @victim_candidate_hash = Victim.authenticate_victim(@facebook_url)
    @victim = Victim.find_or_initialize_by_facebook_url(@facebook_url) # .update_attributes(:name => @victim_candidate_hash[:name]) 
    @victim.assign_attributes(:name => @victim_candidate_hash['name'], :gender => @victim_candidate_hash['gender'], :facebook_id => @victim_candidate_hash['id'])
    respond_to do |format|
      if @victim.persisted?
        format.html { redirect_to @victim, notice: "#{@victim.name} is already in here. Go ahead and add your comment." }
        format.json { render json: @victim, status: :created, location: @victim }
      elsif @victim.save
        format.html { redirect_to @victim, notice: "You successfully invited #{@victim.name} to the bathroom." }
        format.json { render json: @victim, status: :created, location: @victim }
      else
        format.html { render action: "new" }
        format.json { render json: @victim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /victims/1
  # PUT /victims/1.json
  def update
    @victim = Victim.find(params[:id])

    respond_to do |format|
      if @victim.update_attributes(params[:victim])
        format.html { redirect_to @victim, notice: 'Victim was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @victim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /victims/1
  # DELETE /victims/1.json
  def destroy
    @victim = Victim.find(params[:id])
    @victim.destroy

    respond_to do |format|
      format.html { redirect_to victims_url }
      format.json { head :no_content }
    end
  end
end
