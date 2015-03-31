package Moose::Exception::ClassDoesNotHaveInitMeta;
our $VERSION = '2.1403';

use Moose;
extends 'Moose::Exception';
with 'Moose::Exception::Role::Class';

has 'traits' => (
    is       => 'ro',
    isa      => 'ArrayRef',
    required => 1
);

sub _build_message {
    my $self = shift;
    my $class = $self->class_name;

    return "Cannot provide traits when $class does not have an init_meta() method";
}

1;