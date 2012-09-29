#!/usr/bin/env perl

use lib "../lib";
use Alleg::PM;

my %config = do "/secret/alleg.config";

my %input;

my @array = ("fwiffoo","fwiffo");

$input{'username'}=$config{'username'};
$input{'password'}=$config{'password'};
$input{'to'}= \@array;
$input{'message'}='testing pm automation';
$input{'subject'}='auto subject';

PM::send_pm(\%input);

