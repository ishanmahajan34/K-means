function [y_pred, centroids, ss, p, it] = kmeans(X, y, k, centroids, max_iter, required)
    [n, d] = size(X);
    
    y_pred = zeros(n, 1);
            
    for it = 1 : max_iter
        distance = zeros(n, k);
        
        for i = 1 : k
        	distance(:, i) = computeEuclideanDistance(X, centroids(i, :));
        end

        [~, y_pred_iter] = min(distance, [], 2);
        
        centroids = zeros(k, d);
        counts = zeros(k, 1);
        
        for label = 1 : n
            centroids(y_pred_iter(label), :) = centroids(y_pred_iter(label), :) + X(label, :);
            counts(y_pred_iter(label)) = counts(y_pred_iter(label)) + 1;
        end
             
        centroids = centroids ./ counts;
                
        % Convergence condition
        if sum(y_pred_iter == y_pred) == n
            break;
        end
                
        y_pred = y_pred_iter;
    
    end
    
    if required
        ss = computeWithinGroupSum(X, y_pred, centroids, k);
        p = computeP(y, y_pred);
    end
    
end