
function json_string = ckt_to_json(filename)

    function ao = to1D(ai)
        if size(ai,2)==1
            ao = {{ai}};
        else
            ao = ai;
        end
    end

    function ao = to2D(ai)
        if size(ai,1)==1
            ao = {to1D(ai)};
        else
            ao = [];
            for i = 1:size(ai,1)
                ao = [ao {to1D(ai(i,:))}];
            end
        end
        ao = {ao};
    end

    addpath('lib/ece594bb/matlab_parser.win.2022b');
    [LINELEM, NLNELEM, INFO, NODES, LINNAME, NLNNAME, PRINTNV, PRINTBV, PRINTBI, PLOTNV, PLOTBV, PLOTBI] = parser(filename);
    json_string = jsonencode(struct(...
        'LINELEM',  to2D(LINELEM),  ...
        'NLNELEM',  to2D(NLNELEM),  ...
        'INFO',     to1D(INFO'),    ...
        'NODES',    to1D(NODES'),   ...
        'LINNAME',  to2D(LINNAME),  ...
        'NLNNAME',  to2D(NLNNAME),  ...
        'PRINTNV',  to1D(PRINTNV'), ...
        'PRINTBV',  to1D(PRINTBV),  ...
        'PRINTBI',  to1D(PRINTBI),  ...
        'PLOTNV',   to1D(PLOTNV'),  ...
        'PLOTBV',   to1D(PLOTBV),   ...
        'PLOTBI',   to1D(PLOTBI)    ...
    ));

end
