class SubsController < ApplicationController

  # skinny controllers, fat models
  # want controller to be as slim as possible - should be dry and only worry about actions 
  # CRUD create read udate delete

  #index @pple = Person.all
  # show @person = Person.find(params[:id])
  #new @person = Person.new
  # create @person = Person.create(ppl_params)
  # edit @person = Person.find(prams[:id])
  # update @person = Person.find(parms[:id]).update(ppl_parms)
  # delete @person = Person.find(parms[:id]).destroy

  #callbacks 

  # before_action - called before entering a method
  # after_action - clled after entering s method 
  # skip_before_action - skip the before action 
  # skip_after_action - skip the after action 


  #before _action :method_to_call, (only/except): [:index, :show]

  # Models - all logic code 
  # such as ordering, printing 


  before_action :set_sub, only: [:show, :pudate, :edit, :destroy]
  # before_action :set_sub, except: [:index , :new, :create]

  #=====rake notes=====
  # TODO - anythin that meeds to be done 
  #FIXME - fix any bugs
  #OPTMIZE - refactor 

  #TODO fill out indec view

  #FIXME get page not loading 

  #OPTIMIZE - change the color of the text

  # in terminal type = bundle exec rake notes with show you ^ those 

  def index
    @subs = Sub.all
    # render a webpage/views
    # views/subs/indec.html.erb

    # default render html
    # renders or returns data in the form of json, xml , redirect
  end

  def show
  
    # defaul renders show views/subs/show.html.erb
  end
 
  #gets 
  def new
    @sub = Sub.new
    #renders the sub form 
    render patial: "form"
  end

  #post 
  def create 
   @sub = Subs.create(sub_params)
  if @sub.save
    redirect_to root_path
  else
    render :new
  end 

end 

# get
  def edit
    render patial: "form"
    
    #render the edit form 

  end
  # update 
  def update 
   
    if @sub.update(sub_params)
      redirect_to @sub
    else
      render :edit 
    end 
end

#deletes
def destroy
 
  @sub.destroy
  redirect_to root_path

private 
def sub_params
  params.require(sub).permit(:name)
end

def set_sub
  @sub = Sub.find(params[:id])
end 
