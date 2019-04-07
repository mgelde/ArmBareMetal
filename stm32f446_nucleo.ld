MEMORY {
    rom (rx) : ORIGIN = 0x08000000, LENGTH = 512K
    ram (rwx) : ORIGIN = 0x20000000, LENGTH = 128K
}


SECTIONS {

    .text :
    {
        KEEP(* (.vectable))
        * (.text)
    } >rom
    _etext=.;
    .data : AT(_etext)
    {
        . = ALIGN(4);
        _sidata = .;
        * (.data)
        . = ALIGN(4);
        _sedata = .;
    } > ram

}
