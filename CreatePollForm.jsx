import React from "react";
import { Component } from "react";
import { Segment } from "semantic-ui-react";
import { Divider } from "semantic-ui-react";
import { Container } from "semantic-ui-react";
import { Form } from "semantic-ui-react";
import { Grid } from "semantic-ui-react";
import { Icon } from "semantic-ui-react";
import { connect } from "react-redux";
import AppTitle from "../AppTitle/AppTitle";
import QuestionsList from "../QuestionsList/QuestionsList";
import PollOptions from "../PollOptions/PollOptions";
import SavePollButton from "../SavePollButton/SavePollButton";
import PublishPollButton from "../PublishPollButton/PublishPollButton";
import { removeCreatePollData } from "../../actions.js";
import "./CreatePollForm.css";

class CreatePollForm extends Component {
	componentDidMount() {
		window.scrollTo(0, 0);
	}

	componentWillUnmount() {
		this.props.removeCreatePollDataInStore();
	}

	render() {
		return (
			<Segment id="CreatePoll" vertical textAlign="center">
				<Container text>
					<AppTitle />
					<Divider horizontal inverted />
					<Form>
						<QuestionsList minimum="1" />
						<Divider horizontal inverted />
						<PollOptions />
					</Form>
					<Divider horizontal inverted />
					<Grid stackable>
						<Grid.Row only="computer tablet">
							<Grid.Column textAlign="center" width={16}>
								<PublishPollButton primary size="huge">Publier</PublishPollButton>
								<SavePollButton size="huge" tooltip="Sauvegarder le sondage pour le publier plus tard"><Icon name="save"></Icon> Sauvegarder</SavePollButton>
							</Grid.Column>
						</Grid.Row>
						<Grid.Row only="mobile">
							<Grid.Column textAlign="center" width={16}>
								<PublishPollButton fluid primary size="huge">Publier</PublishPollButton>
							</Grid.Column>
							<Grid.Column textAlign="center" width={16}>
								<SavePollButton fluid size="huge" tooltip="Sauvegarder le sondage pour le publier plus tard"><Icon name="save"></Icon> Sauvegarder</SavePollButton>
							</Grid.Column>
						</Grid.Row>
					</Grid>
				</Container>
			</Segment>
		);
	}
}

const mapStateToProps = function(state) {
	return {};
};

const mapDispatchToProps = function(dispatch) {
	return {
		"removeCreatePollDataInStore": function() {
			dispatch(removeCreatePollData());
		}
	};
};

CreatePollForm = connect(mapStateToProps, mapDispatchToProps)(CreatePollForm);
export default CreatePollForm;
