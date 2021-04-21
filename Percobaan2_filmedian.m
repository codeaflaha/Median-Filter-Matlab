clear all; clc; clf;

%input citra mobil
inputMobil = imread('mobil.tif');
[tinggiA, lebarA] = size(inputMobil);
%export ke xls
xlswrite('mobil1.xls',inputMobil)


%proses filter median untuk citra mobil
for baris=2 : tinggiA-1
    for kolom=2 : lebarA-1
        dataA = [inputMobil(baris-1, kolom-1) inputMobil(baris-1, kolom) inputMobil(baris-1, kolom+1)  ...
              inputMobil(baris, kolom-1) inputMobil(baris, kolom) inputMobil(baris, kolom+1)  ...
              inputMobil(baris+1, kolom-1) inputMobil(baris+1, kolom) inputMobil(baris+1, kolom+1)];
        
        % Urutkan
        for i=1 : 8
            for j=i+1 : 9
                if dataA(i) > dataA(j)
                    tmpA = dataA(i);
                    dataA(i) = dataA(j);
                    dataA(j) = tmpA;
                end
            end
        end 
        
        % Ambil nilai median
        outputMobil(baris, kolom) = dataA(5);
    end
end

%export ke xls
xlswrite('mobil2.xls',outputMobil)

%subplot citra input dan output
subplot(1,2,1);imshow(inputMobil);title('Citra Asal');
subplot(1,2,2);imshow(outputMobil);title('Setelah difilter median');
