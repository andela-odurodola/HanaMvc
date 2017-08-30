class MyPagesController < Hanamvc::Controller
  def about
    render :about, name: "Dami", last_name: "Duro"
  end
end