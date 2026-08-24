# Semantic Model Anti-Patterns

These are prohibited by the [Fabric Engineering OS Constitution](../../CONSTITUTION.md):

- **One giant flat table:** sacrificing stable grain, reuse, compression, and understandable filter behavior for initial convenience.
- **Implicit measures:** allowing consumers to aggregate columns inconsistently instead of publishing explicit governed measures.
- **DAX as data repair:** masking duplicate keys, missing history, or incorrect business rules that belong in the data product.
- **Bidirectional by default:** using broad filter propagation to make a visual work without proving ambiguity and security effects.
- **Many-to-many without ownership:** introducing bridges or limited relationships without declared semantics and test cases.
- **Mode by fashion:** choosing Direct Lake, Import, or DirectQuery without workload, source, feature, region, capacity, and performance evidence.
- **RLS by eyeballing:** validating security only with an administrator account or one positive case.
- **Breaking rename:** changing measure/column identity or meaning without compatibility analysis and versioned migration.
- **Hidden complexity:** publishing unexplained measures, fields, calculation logic, or technical columns.
- **Desktop-only artifact:** keeping the model outside source control with no diff, tests, deployment, or rollback evidence.
- **Autonomous endorsement/release:** allowing an agent to endorse, merge, or deploy production.
