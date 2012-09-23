#!/usr/bin/env perl


#need a check for failed pm sending due to wrong recipient name

use warnings;
use strict;

use WWW::Mechanize;
use LWP::Debug;
use CGI ':standard';

#my %config = do "/secret/alleg.config";

my $username=param('username');
my $password=param('password');

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

my $message = param('message');

$agent->form_name('REPLIER');
$agent->field('Post', $message);
$agent->field('from_contact', '-');
$agent->field('msg_title', 'test');
$agent->field('entered_name', 'fwiffo');
$agent->click_button( number => 1);

#$agent->save_content('a.html');

print header;
print "grey: ",param('grey'),"\n";
print "red: ",param('red'),"\n";
