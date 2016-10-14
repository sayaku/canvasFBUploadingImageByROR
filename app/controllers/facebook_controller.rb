class FacebookController < ApplicationController
  before_action :createOAuth

  def uploadImg
  	 if session[:picId]==nil
          session[:picId]=params[:picId]
  	 end	

  	 if(session[:access_token])
       @graph = Koala::Facebook::API.new(session[:access_token])
  	   @photo = Photo.find_by(id: session[:picId])
  	   data = @photo.dataUrl

  	   image_data = StringIO.new(Base64.decode64(data['data:image/png;base64,'.length .. -1]))
  	   @graph.put_picture(image_data,  "image/jpeg",{:message => "圖片測試"})


  	   
  	   session[:picId] = nil
  	   session[:currentState] = nil

       redirect_to app_index_path
      
  	 else
       session[:currentState]="uploadImg"
       @auth_url =  @oauth.url_for_oauth_code(:permissions => "publish_actions,user_photos,user_posts")
	   redirect_to  @auth_url
	 end
  end

  def callback
     if params[:code]
  	   session[:access_token] = @oauth.get_access_token(params[:code])
       redirect_to  facebook_uploadImg_path
     end
    
  end

  def createOAuth
      @oauth=Koala::Facebook::OAuth.new(Settings.Facebook.facebook_app_id, Settings.Facebook.facebook_secret, callback_url)
  end
end
