module ApplicationHelper
  include BootstrapHelper

  def render_game(game)
    if game.puzzle
      image_tag game.puzzle.play.url, onload: "snapfit.add(this, {mixed:true,level:4});"
    end
  end

  def facebook_sdk
    %q{<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1&appId=557805640999968";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>}.html_safe
  end
end
