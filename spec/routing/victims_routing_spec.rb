require "spec_helper"

describe VictimsController do
  describe "routing" do

    it "routes to #index" do
      get("/victims").should route_to("victims#index")
    end

    it "routes to #new" do
      get("/victims/new").should route_to("victims#new")
    end

    it "routes to #show" do
      get("/victims/1").should route_to("victims#show", :id => "1")
    end

    it "routes to #edit" do
      get("/victims/1/edit").should route_to("victims#edit", :id => "1")
    end

    it "routes to #create" do
      post("/victims").should route_to("victims#create")
    end

    it "routes to #update" do
      put("/victims/1").should route_to("victims#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/victims/1").should route_to("victims#destroy", :id => "1")
    end

  end
end
