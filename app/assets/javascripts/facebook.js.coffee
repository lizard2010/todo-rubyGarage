jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

 # $.ajax
 #   url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
 #   dataType: 'script'
 #   cache: true


#  window.fbAsyncInit = ->
#    FB.init(appId: '341975405982394', cookie: true)

#  $('#sign_in').click (e) ->
#    e.preventDefault()
#    FB.login (response) ->
#      window.location = '/auth/facebook/callback' if response.authResponse

#  $('#sign_out').click (e) ->
#    FB.getLoginStatus (response) ->
#      FB.logout() if response.authResponse
#    true

#fbloginCallback() ->
#  window.location.href('/auth/facebook/callback')

`
function fbloginCallback(){
  window.location.href('/auth/facebook/callback');
}

(function(d, s, id) {
/* FB button **/
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=341975405982394&version=v1.0";
fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
`