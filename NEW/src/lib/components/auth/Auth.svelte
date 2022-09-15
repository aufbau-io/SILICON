<script>
	import { supabase } from '$lib/clients/supabaseClient';
	import Bouncer from './bouncer.svelte';

	let loading = false;
	let email;

	const handleLogin = async () => {
		try {
			loading = true;
			const { error } = await supabase.auth.signIn({ email });
			if (error) throw error;
			alert('Check your email for the login link!');
		} catch (error) {
			alert(error.error_description || error.message);
		} finally {
			loading = false;
		}
	};
</script>

<form on:submit|preventDefault={handleLogin}>
	<div>
		<p class="description">Sign in via magic link with your email below</p>
		<div>
			<input class="inputField" type="email" placeholder="Your email" bind:value={email} />
		</div>
		<input
			type="submit"
			class="button block"
			value={loading ? 'Loading' : 'Send magic link'}
			disabled={loading}
		/>
	</div>
</form>
<Bouncer />

<style>
	form {
		margin: 40px 0;
	}

	div {
		padding: 16px 0;
	}

	input[type='email'] {
		font-family: nb-architekt, sans-serif;
		font-size: 40px;
		line-height: 0px;
		background: var(--black);
		border-bottom: solid 1px var(--white);
	}

	input:focus {
		outline: none;
	}

	input::placeholder {
		font-family: nb-architekt, sans-serif;
		color: var(--white);
	}
</style>
