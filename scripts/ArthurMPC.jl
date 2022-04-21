include("MPC.jl")
# using RigidBodyDynamics
# using StaticArrays
# using RobotDynamics
# using Altro
# using TrajectoryOptimization

# model = Arthur()
# n,m = size(model)

# tf = 4.1
# dt = 0.1
# N = Int(round(tf/dt) + 1)

qref = typeof(zeros(7))[]
push!(qref,  [4.9268856741946365e-05, 0.26016423071338934, 3.140069344584098, -2.27008100955155, -2.40769461674617e-05, 0.9598460188468598, 1.569995694393751])
push!(qref,  [-0.003768053224579125, 0.26079787208394173, 3.1395327288847428, -2.269096150780195, -0.004224076946167462, 0.9616197667116058, 1.5721591274301712])
push!(qref,  [-0.01522001946854234, 0.2626987961955988, 3.137922881786677, -2.2661415744661304, -0.016824076946167464, 0.9669410103058437, 1.578649426539432])
push!(qref,  [-0.03430662987514771, 0.26586700304836064, 3.135239803289901, -2.2612172806093556, -0.03782407694616747, 0.9758097496295736, 1.5894665917215332])
push!(qref,  [-0.0610278844443952, 0.2703024926422273, 3.131483493394414, -2.254323269209871, -0.06722407694616747, 0.9882259846827953, 1.6046106229764747])
push!(qref,  [-0.0953296828066516, 0.2759962847990445, 3.126661557197997, -2.2454734980167035, -0.10496455313664366, 1.0041645773154986, 1.6240508594052145])
push!(qref,  [-0.13259401741002397, 0.2821818315115795, 3.121423165847148, -2.23585940048681, -0.14596455313664364, 1.0214797350427807, 1.6451700866655072])
push!(qref,  [-0.1698583520133963, 0.2883673782241145, 3.116184774496299, -2.226245302956917, -0.18696455313664362, 1.0387948927700625, 1.6662893139258002])
push!(qref,  [-0.20712268661676866, 0.2945529249366496, 3.1109463831454507, -2.2166312054270234, -0.2279645531366436, 1.0561100504973449, 1.6874085411860928])
push!(qref,  [-0.24438702122014103, 0.3007384716491846, 3.1057079917946018, -2.20701710789713, -0.2689645531366436, 1.0734252082246267, 1.7085277684463855])
push!(qref,  [-0.2816513558235134, 0.3069240183617196, 3.100469600443753, -2.1974030103672364, -0.3099645531366436, 1.090740365951909, 1.7296469957066785])
push!(qref,  [-0.3189156904268857, 0.31310956507425464, 3.095231209092904, -2.1877889128373433, -0.3509645531366436, 1.108055523679191, 1.7507662229669712])
push!(qref,  [-0.3561800250302581, 0.3192951117867897, 3.089992817742055, -2.17817481530745, -0.39196455313664363, 1.1253706814064732, 1.7718854502272638])
push!(qref,  [-0.3934443596336305, 0.3254806584993247, 3.0847544263912066, -2.1685607177775563, -0.43296455313664367, 1.1426858391337553, 1.7930046774875568])
push!(qref,  [-0.43070869423700286, 0.33166620521185974, 3.0795160350403576, -2.158946620247663, -0.47396455313664365, 1.1600009968610374, 1.8141239047478495])
push!(qref,  [-0.4679730288403753, 0.3378517519243948, 3.0742776436895087, -2.1493325227177693, -0.5149645531366437, 1.1773161545883195, 1.8352431320081424])
push!(qref,  [-0.5052373634437477, 0.34403729863692983, 3.06903925233866, -2.1397184251878762, -0.5559645531366437, 1.1946313123156016, 1.856362359268435])
push!(qref,  [-0.54250169804712, 0.3502228453494649, 3.063800860987811, -2.1301043276579827, -0.5969645531366438, 1.2119464700428837, 1.8774815865287278])
push!(qref,  [-0.5797660326504925, 0.3564083920619999, 3.0585624696369624, -2.1204902301280892, -0.6379645531366438, 1.2292616277701658, 1.8986008137890207])
push!(qref,  [-0.6170303672538648, 0.36259393877453494, 3.0533240782861135, -2.1108761325981957, -0.6789645531366438, 1.2465767854974479, 1.9197200410493134])
push!(qref,  [-0.6542947018572371, 0.36877948548706996, 3.0480856869352646, -2.1012620350683022, -0.7199645531366438, 1.26389194322473, 1.940839268309606])
push!(qref,  [-0.6915590364606096, 0.37496503219960503, 3.0428472955844157, -2.091647937538409, -0.7609645531366438, 1.281207100952012, 1.961958495569899])
push!(qref,  [-0.728823371063982, 0.38115057891214005, 3.0376089042335668, -2.0820338400085157, -0.8019645531366438, 1.2985222586792942, 1.983077722830192])
push!(qref,  [-0.7660877056673544, 0.3873361256246751, 3.0323705128827183, -2.072419742478622, -0.8429645531366439, 1.3158374164065763, 2.0041969500904844])
push!(qref,  [-0.8033520402707267, 0.39352167233721014, 3.0271321215318694, -2.0628056449487286, -0.8839645531366439, 1.3331525741338583, 2.0253161773507773])
push!(qref,  [-0.8406163748740991, 0.39970721904974515, 3.0218937301810205, -2.053191547418835, -0.9249645531366439, 1.3504677318611407, 2.04643540461107])
push!(qref,  [-0.8778807094774715, 0.4058927657622802, 3.0166553388301716, -2.043577449888942, -0.965964553136644, 1.3677828895884225, 2.067554631871363])
push!(qref,  [-0.915145044080844, 0.41207831247481524, 3.0114169474793226, -2.0339633523590486, -1.006964553136644, 1.3850980473157049, 2.0886738591316556])
push!(qref,  [-0.9524093786842164, 0.4182638591873503, 3.006178556128474, -2.024349254829155, -1.0479645531366442, 1.402413205042987, 2.1097930863919485])
push!(qref,  [-0.9896737132875887, 0.42444940589988533, 3.0009401647776253, -2.0147351572992616, -1.088964553136644, 1.419728362770269, 2.1309123136522414])
push!(qref,  [-1.026938047890961, 0.43063495261242035, 2.9957017734267763, -2.005121059769368, -1.1299645531366442, 1.4370435204975511, 2.1520315409125343])
push!(qref,  [-1.0642023824943334, 0.43682049932495537, 2.9904633820759274, -1.9955069622394748, -1.1709645531366442, 1.4543586782248332, 2.173150768172827])
push!(qref,  [-1.101466717097706, 0.44300604603749044, 2.9852249907250785, -1.9858928647095815, -1.2119645531366443, 1.4716738359521153, 2.1942699954331197])
push!(qref,  [-1.1387310517010785, 0.4491915927500255, 2.97998659937423, -1.976278767179688, -1.2529645531366442, 1.4889889936793974, 2.215389222693412])
push!(qref,  [-1.1759953863044506, 0.45537713946256053, 2.974748208023381, -1.9666646696497945, -1.2939645531366444, 1.5063041514066795, 2.236508449953705])
push!(qref,  [-1.213259720907823, 0.46156268617509555, 2.969509816672532, -1.9570505721199012, -1.3349645531366443, 1.5236193091339616, 2.257627677213998])
push!(qref,  [-1.2478021278200226, 0.46729641720217435, 2.9646540572035307, -1.9481387245716801, -1.3729697583408722, 1.5396697023673502, 2.277204276379416])
push!(qref,  [-1.2748022884966306, 0.4717782027187738, 2.9608585403999896, -1.9411727561509207, -1.402676624155692, 1.5522155332738579, 2.292506375168055])
push!(qref,  [-1.2941678050105965, 0.47499270549426853, 2.9581362549951593, -1.9361765052728712, -1.423983489970512, 1.5612138684508734, 2.3034816078838536])
push!(qref,  [-1.3058986773619201, 0.4769399255286585, 2.9564872009890393, -1.9331499719375316, -1.4368903557853316, 1.566664707898397, 2.310129974526812])
push!(qref,  [-1.3099949055506017, 0.47761986282194374, 2.95591137838163, -1.932093156144902, -1.4413972216001514, 1.5685680516164289, 2.3124514750969296])
push!(qref,  [-1.3100000000000003, 0.47762070845504206, 2.955910662235214, -1.9320918417907373, -1.4414028267565981, 1.568570418791257, 2.312454362330413]);

q̇ref = typeof(zeros(7))[]
push!(q̇ref,  [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
push!(q̇ref,  [-0.07634644162642143, 0.012672827411047383, -0.010732313987104905, 0.019697175427098694, -0.084, 0.03547495729491942, 0.04326866072840471])
push!(q̇ref,  [-0.15269288325284286, 0.025345654822094766, -0.02146462797420981, 0.03939435085419739, -0.168, 0.07094991458983883, 0.08653732145680942])
push!(q̇ref,  [-0.22903932487926432, 0.03801848223314215, -0.032196941961314715, 0.05909152628129609, -0.252, 0.10642487188475827, 0.12980598218521414])
push!(q̇ref,  [-0.3053857665056857, 0.05069130964418953, -0.04292925594841962, 0.07878870170839478, -0.336, 0.14189982917967767, 0.17307464291361885])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3726433460337236, 0.061855467125350325, -0.05238391350848822, 0.09614097529893409, -0.41, 0.17315157727282096, 0.21119227260292772])
push!(q̇ref,  [-0.3081748275792907, 0.05115426887151827, -0.04332132502896183, 0.07950827192114293, -0.3390686581481977, 0.14319578771253505, 0.17465531825059288])
push!(q̇ref,  [-0.2318283859528692, 0.038481441460470875, -0.03258901104185691, 0.05981109649404422, -0.2550686581481976, 0.1077208304176156, 0.13138665752218814])
push!(q̇ref,  [-0.1554819443264477, 0.02580861404942348, -0.021856697054752, 0.04011392106694551, -0.17106865814819755, 0.07224587312269615, 0.08811799679378339])
push!(q̇ref,  [-0.07913550270002623, 0.013135786638376092, -0.011124383067647084, 0.0204167456398468, -0.08706865814819748, 0.036770915827776696, 0.04484933606537864])
push!(q̇ref,  [-0.002789061073605048, 0.00046295922732875194, -0.00039206908054222056, 0.0007195702127481829, -0.0030686581481977893, 0.0012959585328574108, 0.0015806753369740911])
push!(q̇ref,  [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);

params = MPC_Params()

Xref = typeof(zeros(14))[]
for k = 1:length(qref)
    push!(Xref, [qref[k]; q̇ref[k]])
end

for k = 1:params.H
    push!(Xref, [qref[end]; q̇ref[end]])
end

# prob = ArthurProblem(Xref, params=params)
# altro = ALTROSolver(prob, params.opts)
# solve!(altro)
# Z_track = TrajectoryOptimization.get_trajectory(prob)
global x0 = [-0.012784051833563126, 0.2722778684209022, 3.170027245975045, -2.2336492735211575, 0.03408274619129692, 1.226885242471706, 1.5562949837009983, -0.0005575828038824746, 3.2918256112210627e-6, 0.0011079314450628355, -7.003196207031308e-6, -0.0003270387146453352, 6.465030966857781e-7, -5.557828320653166e-5]
global prob_mpc = ArthurHorizonProblem(Xref, x0, params.H, start=1)
global altro_mpc = ALTROSolver(prob_mpc, params.opts)
solve!(altro_mpc)
println(states(altro_mpc))
println(controls(altro_mpc))

# num_iters = length(Z_track) - prob_mpc.N
# X_traj = [zero(state(Z_track[1])) for i = 1:num_iters+1]
# X_traj[1] = state(Z_track[1])
# U_traj = [zero(control(Z_track[1])) for i = 1:num_iters]

# t0 = 0
# k_mpc = 1
# for i = 1:num_iters
#     global t0 += params.dt
#     global k_mpc += 1

#     # Update the ALTRO solution, advancing forward by 1 time step
#     U_traj[i] = control(prob_mpc.Z[1])
#     # mpc_update(altro_mpc, prob_mpc, Z_track, t0, k_mpc)
#     x0 = rk4(prob_mpc.model, state(prob_mpc.Z[1]), control(prob_mpc.Z[1]), prob_mpc.Z[1].dt)
#     println(x0)
#     mpc_update(altro_mpc, prob_mpc, Z_track, x0, t0)
#     X_traj[i+1] = prob_mpc.x0

#     solve!(altro_mpc)
#     # println(i)
# end

# X_traj = typeof(zero(state(Z_track[1])))[]
# push!(X_traj, state(Z_track[1]))
# U_traj = typeof(zero(control(Z_track[1])))[]

X_traj = typeof(Xref[1])[]
push!(X_traj, x0)
U_traj = typeof(zeros(7))[]

t0 = 0
global iter = 1
max_iters = length(Xref) + params.H
# errors = Float64[]
# push!(errors, Inf)
# push!(errors, norm(X_traj[end] - Xref[end]))
while norm(X_traj[end] - Xref[end]) > 0.1# && iter < max_iters#&& norm(errors[iter+1] - errors[iter]) > 0.003
    # println(iter)
    global iter += 1
    global t0 += params.dt
    # Update the ALTRO solution, advancing forward by 1 time step
    push!(U_traj, control(prob_mpc.Z[1]))
    # mpc_update(altro_mpc, prob_mpc, Z_track, t0, k_mpc)
    x0 = rk4(prob_mpc.model, state(prob_mpc.Z[1]), control(prob_mpc.Z[1]), params.dt)
    # x0 = [-0.012784051833563126, 0.2722778684209022, 3.170027245975045, -2.2336492735211575, 0.03408274619129692, 1.226885242471706, 1.5562949837009983, -0.0005575828038824746, 3.2918256112210627e-6, 0.0011079314450628355, -7.003196207031308e-6, -0.0003270387146453352, 6.465030966857781e-7, -5.557828320653166e-5]
    # x0 = Xref[1]
    # mpc_update(altro_mpc, prob_mpc, Z_track, cons, x0, t0)
    k_mpc = argmin(norm.([(Xref[k][1:7] - x0[1:7]) for k=1:length(Xref)]))
    # k_mpc = 1
    println(k_mpc)
    # println(norm(X_traj[end] - Xref[end]))
    # println(X_traj[end])
    # println(prob_mpc.Z[1].dt)
    global prob_mpc = ArthurHorizonProblem(Xref, x0, params.H, start=k_mpc)
    global altro_mpc = ALTROSolver(prob_mpc, params.opts)
    solve!(altro_mpc)
    # println(states(altro_mpc))
    # println(controls(altro_mpc))
    
    push!(X_traj, prob_mpc.x0)
    # println(U_traj[end])
    # push!(errors, norm(X_traj[end] - Xref[end]))
    # solve!(altro_mpc)
end
# for traj in X_traj
#     println(traj)
# end
# for traj in U_traj
#     println(traj)
# end

X_sim = typeof(Xref[1])[]
push!(X_sim, X_traj[1])
for k = 1:length(X_traj)-1
    # X_sim[k+1] = discrete_dynamics(TrajectoryOptimization.integration(prob_mpc), params.model, X_sim[k], U_traj[k], 0.0, params.dt)
    push!(X_sim, rk4(params.model, X_sim[k], U_traj[k], params.dt))
end
for traj in X_sim
    println(traj)
end
println(argmin(norm.([(X_sim[k] - Xref[end]) for k = 1:length(X_sim)])))
println(X_sim[argmin(norm.([(X_sim[k] - Xref[end]) for k = 1:length(X_sim)]))])
println(X_sim[argmin(norm.([(X_sim[k] - Xref[end]) for k = 1:length(X_sim)]))] - Xref[end])
println(norm(X_sim[argmin(norm.([(X_sim[k] - Xref[end]) for k = 1:length(X_sim)]))][1:7] - Xref[end][1:7]))
# println([(errors[k+1] - errors[k]) for k = 1:(length(errors)-1)])
# # TODO:
# # Uref could be just U equilibrium (just gravity compensation),
# # Xref could be the desired joint and cartesian positions and velocities, and then 0 for the forces

# state = MechanismState(model.mechanism)
# zero!(state)
# v̇ = similar(velocity(state))
# for joint in joints(state.mechanism)
#     if joint == joints(state.mechanism)[2] || joint == joints(state.mechanism)[3] || joint == joints(state.mechanism)[4] || joint == joints(state.mechanism)[5] || joint == joints(state.mechanism)[6] || joint == joints(state.mechanism)[7] || joint == joints(state.mechanism)[8]
#         v̇[joint][1] = 0.0
#     end
# end

# Qref = Vector{Float64}[]
# Uref = Vector{Float64}[]
# push!(Qref, copy(Xref[1][1:14]))
# for k = 1:N-1
#     set_configuration!(state, Qref[k][1:7])
#     set_velocity!(state, Qref[k][8:end])
#     push!(Uref, inverse_dynamics(state, v̇))
#     push!(Qref, rk4(model, Qref[k], Uref[k], dt))
# end

# dtref = [dt for k=1:N]
# traj = RobotDynamics.Traj(Xref, Uref, dtref, cumsum(dtref) .- dtref[1]);

# # Set up
# # TODO: Tune weights
# Q = 100.0*Diagonal(@SVector ones(n))
# Qf = 100*Diagonal(@SVector ones(n))
# R = 1.0e-1*Diagonal(@SVector ones(m))
# obj = TrajectoryOptimization.TrackingObjective(Q, R, traj, Qf=Qf)

# # Create Empty ConstraintList
# conSet = ConstraintList(n,m,N)

# # Control Bounds based on Robot Specs (Joint torque limits)
# u_bnd = [39.0, 39.0, 39.0, 39.0, 9.0, 9.0, 9.0]
# control_bnd = BoundConstraint(n,m, u_min=-u_bnd, u_max=u_bnd)
# add_constraint!(conSet, control_bnd, 1:N-1)

# # State Bounds based on Robot Specs (Joint velocity and speed limits)
# x_bnd = zeros(n)
# x_bnd[1:7] = [Inf, deg2rad(128.9), Inf, deg2rad(147.8), Inf, deg2rad(120.3), Inf] # rad
# x_bnd[8:14] = [1.39, 1.39, 1.39, 1.39, 1.22, 1.22, 1.22] # rad/sec
# # x_bnd[8:14] = [0.25, 0.05, 0.05, 0.05, 0.25, 0.15, 0.15] # rad/sec
# # x_bnd[15:end] = [Inf for k=1:(n-14)] # Constraints on force elsewhere
# state_bnd = BoundConstraint(n,m, x_min=-x_bnd, x_max=x_bnd)
# add_constraint!(conSet, state_bnd, 1:N)

# # # Cartesian Velocity Bound
# # ẋ_max = 0.0005 # m/s
# # vel_bnd = NormConstraint(n, m, ẋ_max, Inequality(), 21:23)
# # add_constraint!(conSet, vel_bnd, 1:N)

# # # Force Bound (Fx Fy Fz)
# # F_max = 20 # Newtons
# # F_bnd = NormConstraint(n, m, F_max, Inequality(), 27:29)
# # add_constraint!(conSet, F_bnd, 1:N)

# # Other possible constraints:
# # Cartesian angular velocity bounds?
# # External moment bounds?

# # Goal Constraint - only if you want the final state to be the desired state
# # goal = GoalConstraint(xf)
# # add_constraint!(conSet, goal, N)

# prob = Problem(model, obj, Xref[end], tf, x0=Xref[1], constraints=conSet, X0=Xref, U0=Uref)

# opts = SolverOptions(
#     cost_tolerance_intermediate=1e-2,
#     penalty_scaling=10.,
#     penalty_initial=1.0,
#     projected_newton=false,
# )

# altro = ALTROSolver(prob, opts)
# set_options!(altro, show_summary=true)
# for k = 1:10
#     solve!(altro);
# end




# # Get some info on the solve
# max_violation(altro)
# cost(altro)
# iterations(altro)

# # Extract the solution
# X = states(altro)
# U = controls(altro)

# # Extract the solver statistics
# stats = Altro.stats(altro)   # alternatively, solver.stats
# stats.iterations             # equivalent to iterations(solver)
# stats.iterations_outer       # (number of Augmented Lagrangian iterations)
# stats.iterations_pn          # (number of projected newton iterations)
# stats.cost[end]              # terminal cost
# stats.c_max[end]             # terminal constraint satisfaction
# stats.gradient[end]          # terminal gradient of the Lagrangian
# dstats = Dict(stats)         # get the per-iteration stats as a dictionary (can be converted to DataFrame)

# using Printf
# for i in 1:N
#     print("x")
#     print(i-1)
#     print(":\t")
#     println(round.(X[i][8:14]; digits=5))
# end
# println()

# for i in 1:N-1
#     print("u")
#     print(i)
#     print(": ")
#     println(U[i])
# end
# println()

# for i in 1:N
#     print("x")
#     print(i-1)
#     print(": ")
#     println(norm(X[i] - Xref[i]))
# end
# println()

# print("Terminal Error: ")
# println(norm(X[end] - Xref[end]))
# println(X[end] - Xref[end])

# for i in 1:N-1
#     print("u")
#     print(i)
#     print(": ")
#     println(U[i] - Uref[i])
# end

# using MeshCat, MeshCatMechanisms, Blink
# urdf = "../../../kortex_description/arms/gen3/7dof/urdf/GEN3_URDF_V12 copy.urdf"
# body = findbody(model.mechanism, "Bracelet_Link")
# point = Point3D(default_frame(body), 0., 0, -0.07)
# # Create the visualizer
# vis = MechanismVisualizer(model.mechanism, URDFVisuals(urdf))

# # Render our target point attached to the robot as a sphere with radius 0.07
# setelement!(vis, point, 0.01)

# qs = Vector{Float64}[]
# for x in X
#     push!(qs, copy(x[1:7]))
# end
# ts = collect(0:dt:(N-1)*dt);

# setanimation!(vis, Animation(vis, ts, qs))
# render(vis)

