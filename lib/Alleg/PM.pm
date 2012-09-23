package PM;

require Exporter;
use warnings;
use strict;
use WWW::Mechanize;

use vars qw($VERSION);

$VERSION = '0.01';

my @ISA = qw(Exporter);
my @EXPORT = qw();



#need a check for failed pm sending due to wrong recipient name



my $agent = WWW::Mechanize->new();

$agent->get('http://www.freeallegiance.org/forums/index.php');
$agent->follow_link(text => 'Log In', n => '1');
$agent->form_name('LOGIN');
$agent->field('UserName', $username);
$agent->tick('CookieDate', '1');
$agent->field('PassWord', $password);
$agent->click();

$agent->get('http://www.freeallegiance.org/forums/index.php?act=Msg&amp;CODE=04');

$agent->follow_link(text => 'Compose New Message');

$agent->form_name('REPLIER');
$agent->field('Post', $message);
$agent->field('from_contact', '-');
$agent->field('msg_title', $subject);
$agent->field('entered_name', $to);
$agent->click_button( number => 1);

