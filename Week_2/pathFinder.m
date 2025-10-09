function paths = pathFinder(G, origins)
    % calculate shortest paths
    % G : graph object to analyse
    % origins : origin/destination node indices to search between
    paths = table({}, {}, {}, []);
    paths.Properties.VariableNames = ["EndNodes", "Nodes", "Edges", "Length"];
    tic;
    for i=origins
        for j=origins
            [p, d, edgepath] = G.shortestpath(i, j);
            paths(end+1, :) = {{[i, j]}, {p}, {edgepath}, d};
        end
    end
    tEnd = toc;

    disp(['Total elapsed time: ', num2str(tEnd)]);
    disp(['Elapsed time per path: ', num2str(tEnd/(length(origins)^2))]);
end