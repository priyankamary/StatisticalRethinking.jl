# Load Julia packages (libraries) needed

using StanOptimize

# Define the OptimizeModel, use model from intro_m1.1s.jl.

sm = OptimizeModel("m1.1s", m1_1s);

# Use observations generated in intro_m1.1s.jl.

m1_1_data = Dict("N" => N, "n" => n, "k" => k);

# Sample using cmdstan
 
rc = stan_optimize(sm, data=m1_1_data);

# Describe the draws

if success(rc)
  optim_stan, cnames = read_optimize(sm)
end
