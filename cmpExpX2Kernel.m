function [train_kernel, test_kernel] = cmpExpX2Kernel(trainD, testD, gamma)
            n = size(trainD, 1);
            t = size(testD, 1);

            train_kernel = zeros(n, n);
            
            for i = 1 : n
                for j = 1 : n
                    num = ((trainD(i, :) - trainD(j, :)) .^ 2);
                    den = (trainD(i, :) + trainD(j, :)) + eps('single');
                    sum_ = (-1 / gamma) * sum(num ./ den);
                    train_kernel(i, j) = exp(sum_);
                end
            end
            
            train_kernel = [(1 : n)', train_kernel];
            
            test_kernel = zeros(t, n);
            
            for i=1 : t
                for j = 1 : n
                    num_t = ((testD(i, :) - trainD(j, :)) .^ 2);
                    den_t = (testD(i, :) + trainD(j, :)) + eps('single');
                    sum_t = (-1 / gamma) * sum(num_t ./ den_t);
                    test_kernel(i,j) = exp(sum_t);
                end
            end
            
            test_kernel = [(1 : t)', test_kernel];
        end