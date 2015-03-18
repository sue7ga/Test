use strict;
use warnings;
use Data::Dumper;
use URI::Encode;
use Mojolicious::Lite;

get '/' => 'index';

post '/create' => sub{
  my $self = shift;
  my $params = $self->req->body_params->to_hash;
  my $name = $params->{country};
  my $uri = URI::Encode->new({encode_reserved => 0});
  my $encode = $uri->encode($name);

  $self->render(text => $encode);
};

app->start;

__DATA__

@@ index.html.ep

<html>
  <body>
    <form method="post" action="<%= url_for('create') %>">
            Contry:<input type="text" name="country"><br>
        <input type="submit" value="Send">    
    </form>
  </body>
</html>

