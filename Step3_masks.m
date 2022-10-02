%% Step 3 get the masks
%first we get masks of the continents
for i = 1:nb
    clear mask; mask = Song(i).regrid(:,:,24,1);
    clear f; f = find(isnan(mask) == 1);
    clear mask2; mask2 = mask;
    mask2(f) = 1;
    clear f; f = find(isnan(mask) == 0);
    mask2(f) = nan;
    Mask(i).conti = mask2;
end

%then we get masks of the continental shelves
for i = 1:nb
    clear mask; mask = Song(i).regrid(:,:,17,1);
    clear f; f = find(isnan(mask) == 1);
    clear mask2; mask2 = mask;
    mask2(f) = 1;
    clear f; f = find(isnan(mask) == 0);
    mask2(f) = nan;
    Mask(i).bathi = mask2;
end

clear mask mask2

%and we put the regrided temperatures in the masks
for i= 1:nb
    Song(i).CS_integ = Mask(i).bathi .* Song(i).integ;
end

%Mask for continental shelf
for i= 1:nb
    mask = Song(i).CS_integ;
    mask(~isnan(mask)) = 0;
    Mask(i).CS_integ = mask;
    clear mask
end

%truncature at 60°Latitude
for i = 1:nb
    cc = Song(i).CS_integ;
    cc(151:179,:) = nan;
    Song(i).lat60 = cc;
    clear cc
end

%templates at lat60
for i= 1:nb
    dd = Song(i).lat60;
    dd(~isnan(dd)) = 0;
    Mask(i).lat60 = dd;
    clear dd; 
end

%% Same but for SamePAL

for i= 1:nb
    Cst8PAL(i).CS_integ = Mask(i).bathi .* Cst8PAL(i).integ;
end

%Mask for continental shelf
for i= 1:nb
    mask = Cst8PAL(i).CS_integ;
    mask(~isnan(mask)) = 0;
    Mask(i).CS_integ = mask;
    clear mask
end

%truncature at 60°Latitude
for i = 1:nb
    cc = Cst8PAL(i).CS_integ;
    cc(151:179,:) = nan;
    Cst8PAL(i).lat60 = cc;
    clear cc
end

%templates at lat60
for i= 1:nb
    dd = Cst8PAL(i).lat60;
    dd(~isnan(dd)) = 0;
    Mask(i).lat60 = dd;
    clear dd; 
end
