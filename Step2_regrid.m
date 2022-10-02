%Step2 : regrid
%We first want to have latdef and longdef as double matrices and in order

longdef=double(longdef);
latdef=double(latdef);
latdef = flipud(latdef);

%longitude axes from -180 to 180
clear f f2;
f = longdef >= 180;
f2 = find(longdef < 180);
longdef=[longdef(f)-360; longdef(f2)]; 

%Now we order the 4D matrices
for i = 1:nb
    clear A B
    A =Song(i).ncdf;
    clear t; t=find(A>100);
    A(t)=nan;
    B = flipud(permute(A,[2 1 3 4]));
    Song(i).temp = cat(2, B(:,f,:,:), B(:,f2,:,:));
end

%% same for 12PAL constant
for i = 1:nb
    clear A B
    A =Cst8PAL(i).ncdf;
    clear t; t=find(A>100);
    A(t)=nan;
    B = flipud(permute(A,[2 1 3 4]));
    Cst8PAL(i).temp = cat(2, B(:,f,:,:), B(:,f2,:,:));
end

clear A B t

%% First we define a new grid 1°lat long

[X,Y]=ndgrid(latdef,longdef);
latdef2=[89:-1:-89];
longdef2 = [-178:1:178];
[X2,Y2]=ndgrid(latdef2,longdef2);

%% Then we regrid the temperatures along the new grid
%we regrid everything (i.e. every month and every depth)

for i=1:nb
    for j=1:size([Song.temp], 4);
        for k=1:size([Song.temp], 3);
            Song(i).regrid(:,:,k,j) =interpn(X,Y,Song(i).temp(:,:,k,j),X2,Y2);
            Cst8PAL(i).regrid(:,:,k,j) =interpn(X,Y,Cst8PAL(i).temp(:,:,k,j),X2,Y2);
        end
    end
end

clear latdef longdef i j k
latdef = latdef2;
longdef = longdef2;    

clear latdef2 longdef2

%% Finally we create a single matrice for the annual integrated temperatures of the water column

for i = 1: nb
    clear aa bb
    %     aa = squeeze(mean(Song(i).regrid(:,:,20:24,:), 3));
    aa = Song(i).regrid;
    aa = squeeze(aa(:,:,24,:).*20 + aa(:,:,23,:) .*20.5 + aa(:,:,22,:).*22 + aa(:,:,21,:).*24.25 + aa(:,:,20,:).*27.5);
    aa = aa/(20 + 20.5 + 22 + 24.25 + 27.5);
    Song(i).seasonality = aa;
    bb = mean(aa, 3);
    Song(i).integ = bb;
end

for i = 1: nb
    clear aa bb
    %     aa = squeeze(mean(Cst8PAL(i).regrid(:,:,20:24,:), 3));
    aa = Cst8PAL(i).regrid;
    aa = squeeze(aa(:,:,24,:).*20 + aa(:,:,23,:) .*20.5 + aa(:,:,22,:).*22 + aa(:,:,21,:).*24.25 + aa(:,:,20,:).*27.5);
    aa = aa/(20 + 20.5 + 22 + 24.25 + 27.5);
    Cst8PAL(i).seasonality = aa;
    bb = mean(aa, 3);
    Cst8PAL(i).integ = bb;
    clear aa bb
end

clear aa bb