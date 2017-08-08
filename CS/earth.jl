M = 1.9891e30;  m = 5.9736e24;	G = 6.67259e-11;
dt = 43200;	nt = Int(3650*24/12);

start = time()

t = (0:1:nt)' *dt;
r = zeros(nt+2,3); v = zeros(nt+2,3); a = zeros(nt+2,3);

r[1,:] = 1.49597870691E+11.*[-9.851920196143998E-01  1.316466809434336E-01 -4.877392224782687E-06];
r[2,:] = 1.49597870691E+11.*[-9.864337701483683E-01  1.230799243164879E-01 -4.374019384763304E-06];
a[1,:] = -G*M/(norm(r[1,:])^3) * r[1,:];
a[2,:] = -G*M/(norm(r[2,:])^3) * r[2,:];
v[1,:] = -(r[1,:] - r[2,:])/dt;
v[2,:] = v[1,:] + (a[1,:]+a[2,:]) / 2 * dt;

for i = 3 : nt+1
    r[i,:] = r[i-1,:] + v[i-1,:] * dt + 1/2 * a[i-1,:] * (dt^2);
    a[i,:] = -G*M/(norm(r[i,:]))^3 * r[i,:];   
    v[i,:] = v[i-1,:] + (a[i-1,:]+a[i,:]) / 2 * dt;
end

r_rev = zeros(nt+2,3); v_rev = zeros(nt+2,3); a_rev = zeros(nt+2,3);

r_rev[1,:] = r[nt+1,:];
r_rev[2,:] = r[nt,:];
a_rev[1,:] = -G*M/(norm(r_rev[1,:])^3) * r_rev[1,:];
a_rev[2,:] = -G*M/(norm(r_rev[2,:])^3) * r_rev[2,:];
v_rev[1,:] = -v[7301,:];
v_rev[2,:] = v_rev[1,:] + (a_rev[1,:]+a_rev[2,:]) / 2 * dt;

for i = 3 : nt+1
    r_rev[i,:] = r_rev[i-1,:] + v_rev[i-1,:] * dt + 1/2 * a_rev[i-1,:] * (dt^2);
    a_rev[i,:] = -G*M/(norm(r_rev[i,:]))^3 * r_rev[i,:];   
    v_rev[i,:] = v_rev[i-1,:] + (a_rev[i-1,:]+a_rev[i,:]) / 2 * dt;
end

endtime = time() - start
