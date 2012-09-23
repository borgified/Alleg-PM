use ExtUtils::MakeMaker;
WriteMakefile(
	'NAME'			=> 'Alleg::PM',
	'VERSION_FROM'	=> 'lib/Alleg/PM.pm',
	'PREREQ_PM'		=> {
						WWW::Mechanize		=> 1.72,
						}
);
