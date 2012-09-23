package PM;

#need a check for failed pm sending due to wrong recipient name


=head1 NAME

Alleg::PM - an interface for sending private messages (PMs) through http://freeallegiance.org forums

=head1 SYNOPSIS

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

=head1 DESCRIPTION

Alleg::PM is a simple interface using WWW::Mechanize to automate the login process and sending of PMs. This is useful for sending multiple PMs to a group of forum members to advertise an event.

=cut

require Exporter;
use warnings;
use strict;
use WWW::Mechanize;

use vars qw($VERSION);

$VERSION = '0.01';

my @ISA = qw(Exporter);
my @EXPORT = qw(send_pm);

sub send_pm {

	my($hashref)=shift @_;

	my $username = $$hashref{'username'};
	my $password = $$hashref{'password'};
	my $to = $$hashref{'to'};
	my $message = $$hashref{'message'};
	my $subject = $$hashref{'subject'};

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

}
1;

