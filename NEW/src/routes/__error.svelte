<script context="module">
	export function load({ error, status }) {
		return {
			props: { error, status }
		};
	}
</script>

<script>
	import ErrorScreen from '$lib/components/error/errorScreen.svelte'; // your own Error screen component
	import NotFoundScreen from '$lib/components/error/notFoundScreen.svelte'; // your own 404 screen component

	export let error;
	export let status;
</script>

<!-- Used '==' instead of '===' to match string/number status code (just to be sure) -->
{#if status == 404}
	<NotFoundScreen />
{:else}
	<ErrorScreen {error} {status} />
{/if}
