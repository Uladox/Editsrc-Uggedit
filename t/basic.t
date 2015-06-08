use v6;

use Test;
plan 1;

use Editsrc::Uggedit;
# Note this needs more work
{
    # my $test-Uggedit = Editsrc::Uggedit::Editor.new(
    # 	editLineName => 'src_k',
    # 	editFile => 'multilang',
    # 	# ignoreEditLine => False,
    # 	# captureField => False,
    # 	# addText => False,
    # 	# textToAdd => "# This is some added Text\n",
    # );

    # $test-Uggedit.ignoreEditLine = False;
    # $test-Uggedit.addText = False;
    # $test-Uggedit.execFile();
    my $test-Uggedit = Editsrc::Uggedit::Editor.new(
     	editLineName => 'src_k',
    	editFile => 'multilang',
	ignoreEditLine => True,
	addText => True,
	textToAdd => "# This is some added Text\n",
	captureField => True,
    );
    ok $test-Uggedit.execFile().index("# This is some added Text").defined,
      'Able to add Text';
    $test-Uggedit.ignoreEditLine = False;
    $test-Uggedit.addText = False;
    $test-Uggedit.execFile().index("#! \$e = \"cats\";").defined,
      'Can run code';
    
}

done;
