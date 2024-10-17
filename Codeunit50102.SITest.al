codeunit 50102 SITest
{
    //SingleInstance = True;

    var
        testtext: Text;

    procedure setzetext(textneu: Text)
    begin
        testtext := textneu;
    end;

    procedure messagetext();
    begin
        Message(testtext);
    end;

}
