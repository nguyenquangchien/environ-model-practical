phi_prime(u_prime,c,k)=exp((-1.0*(u_prime/c)**k))
freq_cut_in=phi_prime(3.0,5.32883,1.55037)
freq_cut_out=phi_prime(20.0,5.32883,1.55037)
print freq_cut_in-freq_cut_out
