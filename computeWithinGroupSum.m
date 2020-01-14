function ss = computeWithinGroupSum(X, y, centroids, k)
    ss = 0;
	
    for i = 1 : k
        ss = ss + sum(computeEuclideanDistance(X((y == i), :), centroids(i, :)));
    end
    
end
