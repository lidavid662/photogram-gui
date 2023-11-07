Rails.application.routes.draw do
  get("/photos", { :controller => "photos", :action => "index" })
  
  get("/photos/:path_id", { :controller => "photos", :action => "show" })

  post("/insert_photo", { :controller => "photos", :action => "create" })

  post("/add_comment/:path_id", { :controller => "photos", :action => "comment" })
  
  post("/modify_photo/:path_id", { :controller => "photos", :action => "update" })

  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })

  get("/users", { :controller => "users", :action => "index" })

  get("/", { :controller => "users", :action => "index" })
  
  get("/users/:username", { :controller => "users", :action => "show" })

  post("/modify_user/:path_id", { :controller => "users", :action => "update" })

  post("/insert_user", { :controller => "users", :action => "create" })
end
