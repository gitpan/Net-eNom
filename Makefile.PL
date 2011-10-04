
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Interact with eNom, Inc.'s reseller API",
  "AUTHOR" => "Simon Cozens <simon at simon-cozens.org>, Richard Sim\303\265es <rsimoes at cpan.org>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "HTML::Parser" => 0,
    "Moose" => 0,
    "Test::More" => 0,
    "Test::Most" => "0.22",
    "ok" => 0,
    "perl" => "5.006"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Net-eNom",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Net::eNom",
  "PREREQ_PM" => {
    "Any::Moose" => 0,
    "Carp" => 0,
    "Data::Validate::Domain" => 0,
    "English" => 0,
    "LWP::Simple" => 0,
    "List::MoreUtils" => 0,
    "ParseUtil::Domain" => "2.07",
    "URI" => 0,
    "XML::Simple" => 0,
    "strict" => 0,
    "utf8" => 0,
    "warnings" => 0
  },
  "VERSION" => "v1.0.0",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



