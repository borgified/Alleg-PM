#!/usr/bin/env perl

use Alleg::PM;

my %config = do "/secret/alleg.config";

my %input;

$input{'username'}=$config{'username'};
$input{'password'}=$config{'password'};
$input{'to'}='fwiffo';
$input{'message'}='testing pm automation';
$input{'subject'}='auto subject';

PM::send_pm(\%input);

