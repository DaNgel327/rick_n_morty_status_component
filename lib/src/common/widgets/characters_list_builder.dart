import 'package:flutter/material.dart';
import 'package:rick_n_morty_status_component/src/common/ext_library.dart';
import 'package:rick_n_morty_status_component/src/service/service_factory.dart';

import '../../model/movie_character.dart';
import '../constants_library.dart';
import '../styles_library.dart';
import 'character_dialog.dart';

class CharactersListBuilder extends StatelessWidget {
  const CharactersListBuilder.build({super.key});

  @override
  Widget build(BuildContext context) => FutureBuilder<List<MovieCharacter>>(
        future: ServiceFactory.movieCharacterService.fetchedCharacters,
        builder: (context, snapshot) =>
            !(snapshot.connectionState == ConnectionState.done)
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemCount: snapshot.requireData.length,
                    itemBuilder: (_, index) => _CharacterCard(
                      currentCharacter: snapshot.requireData[index],
                    ),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    separatorBuilder: (_, __) => const Divider(
                      thickness: NumberConstants.dividerThickness,
                      height: NumberConstants.dividerHeight,
                      color: CommonColors.dividerColor,
                    ),
                  ),
      );
}

class _CharacterCard extends StatelessWidget {
  const _CharacterCard({required this.currentCharacter});

  final MovieCharacter currentCharacter;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => _showDialog(context),
        child: SizedBox(
          height: NumberConstants.dialogHeight,
          child: Card(
            color: currentCharacter.status.isAlive
                ? CommonColors.aliveStatusColor
                : CommonColors.notAliveStatusColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: NumberConstants.cardImageFlexValue,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(NumberConstants.defaultRadius),
                    child: Image.network(currentCharacter.image),
                  ),
                ),
                const Expanded(
                  flex: NumberConstants.cardDividerFlexValue,
                  child: SizedBox.shrink(),
                ),
                Expanded(
                  flex: NumberConstants.cardTextFlexValue,
                  child: Text(
                    currentCharacter.name,
                    style: CommonTextStyles.cardContentTextStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Future<void> _showDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => CharacterDialog(
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(NumberConstants.defaultRadius),
            child: Image.network(currentCharacter.image),
          ),
          trailingTitleWidget: Text(
            currentCharacter.name,
            style: CommonTextStyles.dialogTitleTextStyle,
          ),
          content: Column(
            children: [
              Text.rich(
                TextSpan(
                  text: StringConstants.cardSpeciesTitle,
                  style: CommonTextStyles.dialogContentBoldTextStyle,
                  children: <TextSpan>[
                    TextSpan(
                      text: currentCharacter.species.name.capitalize(),
                      style: CommonTextStyles.dialogContentNormalTextStyle,
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: StringConstants.statusSpeciesTitle,
                  style: CommonTextStyles.dialogContentBoldTextStyle,
                  children: <TextSpan>[
                    TextSpan(
                      text: currentCharacter.status.name.capitalize(),
                      style: CommonTextStyles.dialogContentNormalTextStyle,
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: StringConstants.genderSpeciesTitle,
                  style: CommonTextStyles.dialogContentBoldTextStyle,
                  children: <TextSpan>[
                    TextSpan(
                      text: currentCharacter.gender.name.capitalize(),
                      style: CommonTextStyles.dialogContentNormalTextStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                StringConstants.closeButtonText,
                style: CommonTextStyles.dialogContentBoldTextStyle,
              ),
            )
          ],
        ),
      );
}
