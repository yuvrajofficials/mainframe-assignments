
infile  = "Z66845.REXX.INPUT"
outfile = "Z66845.REXX.SORTED"

address TSO "ALLOC FI(INFILE)  DA('"infile"')  SHR REUSE"
address TSO "ALLOC FI(OUTFILE) DA('"outfile"') MOD REUSE"

unique. = ""    
keymap. = ""    
count = 0

"EXECIO * DISKR INFILE (STEM IN. FINIS"

do i = 1 to in.0
    rec = in.i
    key = substr(rec, 25, 8)
    if unique.key = "" then do
        count = count + 1
        unique.key = rec
        keymap.count = key
    end
end

do i = 1 to count
    do j = i+1 to count
        if keymap.i > keymap.j then do
            temp = keymap.i
            keymap.i = keymap.j
            keymap.j = temp
        end
    end
end

do i = 1 to count
    key = keymap.i
    out.i = unique.key
end

"EXECIO "count" DISKW OUTFILE (STEM OUT. FINIS"

address TSO "FREE FI(INFILE)"
address TSO "FREE FI(OUTFILE)"

say "Done: Removed duplicates and sorted records by key (cols 25–32)."
exit
