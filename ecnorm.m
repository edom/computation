% k strike price; row vector
% m mean; row vector
% s standard deviation; row vector
% y row vector
function y = ecnorm (ks, ms, ss);
    c = max([length(ks), length(ms), length(ss)]);
    % padding
    ks(length(ks) + 1 : c) = ks(length(ks));
    ms(length(ms) + 1 : c) = ms(length(ms));
    ss(length(ss) + 1 : c) = ss(length(ss));
    ys = zeros(1,c);
    for i = 1:c;
        k = ks(i);
        m = ms(i);
        s = ss(i);
        minx = k;
        maxx = max([2 .* k, m + 10 .* s]); % fixme
        x = minx : 0.01 : maxx;
        n = 1 - normcdf(minx, m, s);
        ys(i) = sum(normpdf(x, m, s) .* (x - k)) .* 0.01 ./ n;
    end;
    y = ys;
end;
