clear all; clc; close all;
addpath(genpath('RegularizedSC'));

TR_IMG_PATH = 'Data/Training';

dict_size   = 512;          % dictionary size
lambda      = 0.15;         % sparsity regularization
patch_size  = 8;            % image patch size
nSmp        = 1000;       % number of patches to sample
upscale     = 2;            % upscaling factor

% randomly sample image patches
[Xh, Xl] = rnd_smp_patch(TR_IMG_PATH, '*.bmp', patch_size, nSmp, upscale);

% prune patches with small variances, threshould chosen based on the
% training data
%[Xh, Xl] = patch_pruning(Xh, Xl, 10);

% joint sparse coding 
%[Dh, Dl] = train_coupled_dict(Xh, Xl, dict_size, lambda);
%dict_path = ['Dictionary/D_' num2str(dict_size) '_' num2str(lambda) '_' num2str(patch_size) '.mat' ];
%save(dict_path, 'Dh', 'Dl');
