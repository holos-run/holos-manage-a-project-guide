package holos

import api "github.com/holos-run/holos/api/author/v1alpha3"

// Projects defines the structure other teams register with to manage project
// resources.  The platform team defines the schema, development teams provide
// the values.
#Projects: api.#Projects & {
	[NAME=string]: {
		Name: NAME
		// The platform team requires the development teams to indicate an owner of
		// the project.
		Owner: Name: string
		// The default value for the owner email address is derived from the owner
		// name, but development teams can provide a different email address if
		// needed.
		Owner: Email: string | *"sg-\(Owner.Name)@\(#Organization.Domain)"
		// The platform team constrains the project to a single namespace.
		Namespaces: close({(NAME): Name: NAME})
		// The platform team constrains the exposed services to the project
		// namespace.
		Hostnames: [HOST=string]: {
			Name:      HOST
			Namespace: Namespaces[NAME].Name
			Service:   HOST
		}
	}
}

for Project in #Projects {
	let CommonLabels = {
		"\(#Organization.Domain)/project.name": Project.Name
		"\(#Organization.Domain)/owner.name":   Project.Owner.Name
		"\(#Organization.Domain)/owner.email":  Project.Owner.Email
	}

	// Register project namespaces with the namespaces component.
	#Namespaces: {
		for Namespace in Project.Namespaces {
			(Namespace.Name): metadata: labels: CommonLabels
		}
	}
}
