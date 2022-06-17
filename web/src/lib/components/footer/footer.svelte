<script>
	import Logo from './aufbauLogo.svelte';
	// import FormField from '$lib/components/common/formField.svelte';
</script>

<footer>
	<section>
		<main />

		<div class="base">
			<p class="sml">© Copyright 2022</p>
			<Logo />
			<p class="sml">86-90 Paul Street London</p>
		</div>
	</section>
</footer>

<style>
	footer {
		margin: 0 40px;
	}

	main {
		max-height: 543px;
		display: flex;
		margin: 110px 98px 110px 98px;
	}

	.base {
		display: flex;
		justify-content: space-between;
		align-items: center;
		height: 56px;
		border-top: solid 1px var(--white-50);
	}

	.base p {
		padding-bottom: 0;
	}
</style>
