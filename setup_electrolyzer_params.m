% =========================================================================
% INITIALIZATION SCRIPT FOR PEM ELECTROLYZER SIMULINK MODEL
% =========================================================================
% Run this script before running the Simulink model.

clear; clc;

disp('Setting up electrolyzer model parameters...');

% --- 1. Physical Constants ---
F = 96485.3;       % Faraday's constant (C/mol)
R = 8.314;         % Universal gas constant (J/(mol*K))

% --- 2. Operating Conditions ---
T_op = 80 + 273.15; % Operating temperature (K) -> 80 C
P_op = 1;           % Operating pressure (bar)

% --- 3. Cell & Membrane Parameters ---
A = 50;            % Active cell area (cm^2)
l_mem = 180e-4;    % Membrane thickness (cm)

% --- 4. Electrochemical Parameters ---
% Anode (Oxygen Evolution Reaction)
j0_a = 1e-10;      % Anode exchange current density (A/cm^2)
alpha_a = 0.5;     % Anode charge transfer coefficient

% Cathode (Hydrogen Evolution Reaction)
j0_c = 1e-3;       % Cathode exchange current density (A/cm^2)
alpha_c = 0.5;     % Cathode charge transfer coefficient

% --- 5. Pre-calculated Values for Simulink ---
% Membrane Conductivity for Nafion (S/cm)
sigma_mem = (0.005139 * 15 - 0.00326) * exp(1268 * (1/303 - 1/T_op));

% Temperature-corrected Standard Potential (V)
E0_T = 1.229 - 0.00085 * (T_op - 298.15);

% Reversible Voltage (V_rev)
% Since this is constant, we can pre-calculate it.
P_H2 = P_op; P_O2 = P_op; P_H2O = 1;
V_rev = E0_T + (R * T_op / (2 * F)) * log(P_H2 * sqrt(P_O2) / P_H2O);

disp('Parameters loaded into workspace.');