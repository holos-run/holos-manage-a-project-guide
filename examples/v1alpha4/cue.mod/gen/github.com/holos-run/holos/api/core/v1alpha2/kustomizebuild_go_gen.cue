// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/holos-run/holos/api/core/v1alpha2

package v1alpha2

// KustomizeBuild represents a [HolosComponent] that renders plain yaml files in
// the holos component directory using `kubectl kustomize build`.
#KustomizeBuild: {
	#HolosComponent
	kind: string & "KustomizeBuild" @go(Kind)
}
