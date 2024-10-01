package holos

// Manage the component on every workload Cluster, but not management clusters.
for Cluster in #Fleets.workload.clusters {
	#Platform: Components: "\(Cluster.name)/projects": {
		path:    "projects/platform/components/projects"
		cluster: Cluster.name
	}
}
