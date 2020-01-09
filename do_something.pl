sub printParam
{

    print "@_\n"; 
    @x = @_; 
    print "pushed: "; 
    push @x, "biryani"; 
    print "@x\n"; 
    print "Shifted: "; 
    shift @x; 
    print "@x\n"; 
}

&printParam("hafsa", "navid", "memories")
