function dist = computeEuclideanDistance(X, centroid)
    dist = sum((X - centroid) .^ 2, 2);
end