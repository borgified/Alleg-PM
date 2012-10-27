package Alleg::PM;

#need a check for failed pm sending due to wrong recipient name


=head1 NAME

Alleg::PM - an interface for sending private messages (PMs) through http://freeallegiance.org forums

=head1 SYNOPSIS


	use Alleg::PM;
	
	my %config = do "/secret/alleg.config";
	
	my %input;
	
	$input{'username'}=$config{'username'};
	$input{'password'}=$config{'password'};
	$input{'to'}='fwiffo';
	$input{'message'}='testing pm automation';
	$input{'subject'}='auto subject';
	
	PM::send_pm(\%input);


=head1 DESCRIPTION

Alleg::PM is a simple interface using WWW::Mechanize to automate the login process and sending of PMs. This is useful for sending multiple PMs to a group of forum members to advertise an event.

=cut

require Exporter;
use warnings;
use strict;
use WWW::Mechanize;

our $VERSION = '0.01';

my @ISA = qw(Exporter);
my @EXPORT = qw(send_pm);


my $popup_form = '<a href="https://docs.google.com/spreadsheet/embeddedform?formkey=dDFmVFRZYmlwbVJvZXFRTnA5ZlBOZ1E6MQ" onclick="window.open('https://docs.google.com/spreadsheet/embeddedform?formkey=dDFmVFRZYmlwbVJvZXFRTnA5ZlBOZ1E6MQ','popup','width=760,height=640,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false">fix it</a>';

sub send_pm {

	my($hashref)=shift @_;

	my $username = $$hashref{'username'};
	my $password = $$hashref{'password'};
	my $to = $$hashref{'to'}; #this is going to be an array ref
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

	#check if login failed
	if($agent->content() =~ /The following errors were found/){
		print "wrong username or password, cannot continue\n";
		exit;
	}

	foreach my $recipient (@$to){

		$agent->get('http://www.freeallegiance.org/forums/index.php?act=Msg&amp;CODE=04');

		$agent->follow_link(text => 'Compose New Message');

		$agent->form_name('REPLIER');
		$agent->field('Post', $message);
		$agent->field('from_contact', '-');
		$agent->field('msg_title', $subject);
		$agent->field('entered_name', $recipient);
		$agent->click_button( number => 1);
		if($agent->content() =~ /There is no such member/){
			print "unable to PM $recipient $popup_form<br>\n";
		}else{
			print "PM sent to $recipient<br>\n";
		}
	}

}
1;

