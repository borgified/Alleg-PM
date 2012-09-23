Alleg::PM(3)          User Contributed Perl Documentation         Alleg::PM(3)



NNAAMMEE
       Alleg::PM - an interface for sending private messages (PMs) through
       http://freeallegiance.org forums

SSYYNNOOPPSSIISS
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

DDEESSCCRRIIPPTTIIOONN
       Alleg::PM is a simple interface using WWW::Mechanize to automate the
       login process and sending of PMs. This is useful for sending multiple
       PMs to a group of forum members to advertise an event.



perl v5.14.2                      2012-09-22                      Alleg::PM(3)
