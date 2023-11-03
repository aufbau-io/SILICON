<script>
	import { screenType } from '$lib/store/store';
  import Results from '$lib/components/sidebars/results.svelte';
</script>

	<main>

    <Results />

</main>

<style>
	main {
		width: 340px;
		height: 100%;

		margin: auto;
		margin: 0;

		display: flex;
		flex-flow: column nowrap;
		justify-content: space-between;
		/* align-items: flex-start; */
		/* border-left: solid 1px var(--primary-50); */

	
		font-size: 12px;

		backdrop-filter: blur(10px);
	}




	@media only screen and (max-width: 768px) {
		main {
			backdrop-filter: none;
		}
	}
</style>
