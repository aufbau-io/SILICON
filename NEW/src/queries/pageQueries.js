import { GraphQLClient } from 'graphql-request';

export const PageQuery = (query, envVar, variables, preview) => {
	// Added staging environment to endpoint
	const endpoint = preview
		? `https://graphql.datocms.com/environments/${envVar.env}/preview`
		: `https://graphql.datocms.com/environments/${envVar.env}`;
	const client = new GraphQLClient(endpoint, {
		headers: {
			authorization: `Bearer ${envVar.token}`
		}
	});
	return client.request(query, variables);
};
