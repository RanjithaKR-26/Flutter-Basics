import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlConfig {
  // static HttpLink httpLink = HttpLink('http://localhost:5000/graphql');
  static HttpLink httpLink = HttpLink('http://10.0.2.2:5000/graphql');

  static AuthLink authLink = AuthLink(
    getToken: () =>
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IkFiaGkiLCJzdWIiOiI0ODJjZWIxMC00OWQxLTQ5ZDctYjBlMS1iOGU4Njk4Nzg3Y2MiLCJlbWFpbCI6ImFiaGlAZ21haWwuY29tIiwicm9sZSI6IlVTRVIiLCJpYXQiOjE2MzI4MzAyNDcsImV4cCI6MTYzMjgzMzg0N30.WLhx0okBOwYq1yvOMq90wkzvCHdAC4eVwanadVNBwbI',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  static Link link = authLink.concat(httpLink);
  // static HttpLink httpLink = HttpLink('http://localhost:5000/graphql');
  // static HttpLink httpLink = HttpLink('http://10.0.2.2:5000/graphql');

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
    ),
  );
  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
      link: httpLink,
    );
  }
}
